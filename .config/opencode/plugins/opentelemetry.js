import { NodeSDK } from '@opentelemetry/sdk-node';
import { OTLPTraceExporter } from '@opentelemetry/exporter-trace-otlp-http';
import { getNodeAutoInstrumentations } from '@opentelemetry/auto-instrumentations-node';
import { resourceFromAttributes } from '@opentelemetry/resources';
import { SEMRESATTRS_SERVICE_NAME, SEMRESATTRS_SERVICE_VERSION } from '@opentelemetry/semantic-conventions';

const endpoint = process.env.OTEL_EXPORTER_OTLP_ENDPOINT || 'http://localhost:4318';

console.log('[OpenTelemetry] Initializing SDK...');
console.log('[OpenTelemetry] Endpoint:', endpoint);
console.log('[OpenTelemetry] Service:', process.env.OTEL_SERVICE_NAME || 'opencode');

const traceExporter = new OTLPTraceExporter({
  url: `${endpoint}/v1/traces`,
});

const sdk = new NodeSDK({
  resource: resourceFromAttributes({
    [SEMRESATTRS_SERVICE_NAME]: process.env.OTEL_SERVICE_NAME || 'opencode',
    [SEMRESATTRS_SERVICE_VERSION]: '1.0.0',
    'deployment.environment': 'local',
  }),
  traceExporter,
  instrumentations: [getNodeAutoInstrumentations()],
});

sdk.start();

console.log('[OpenTelemetry] SDK started');

export const OpenTelemetryPlugin = async () => {
  return {};
};
